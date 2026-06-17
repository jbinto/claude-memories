#!/usr/bin/env bash
#
# Drift gate for the memories repo. Run by .githooks/pre-commit, or by hand:
#   ./check.sh
#
# Fails (exit 1) if any of these invariants is violated:
#   1. FRONTMATTER  — every memories/*.md has name / description / metadata.type,
#                     and its `name:` equals the filename slug.
#   2. LINKS        — every [[slug]] in memories/ resolves to memories/slug.md.
#   3. INDEX        — every memories/*.md is listed in BOTH README.md and MEMORY.md.
#
# No magic: it's just grep + file tests. Read it top to bottom.

set -u
cd "$(dirname "$0")"
fail=0
note() { printf '  ❌ %s\n' "$1"; fail=1; }

echo "1. frontmatter (name / description / metadata.type; name == slug)"
for f in memories/*.md; do
  slug=$(basename "$f" .md)
  grep -q '^name:'        "$f" || note "$f: missing 'name:'"
  grep -q '^description:' "$f" || note "$f: missing 'description:'"
  grep -q '^  type:'      "$f" || note "$f: missing 'metadata.type'"
  name=$(grep -m1 '^name:' "$f" | sed 's/^name:[[:space:]]*//')
  [ "$name" = "$slug" ] || note "$f: name '$name' != slug '$slug'"
done

echo "2. link integrity ([[slug]] -> memories/slug.md)"
for l in $(grep -rho '\[\[[a-z0-9-]*\]\]' memories/ | sed 's/\[\[//; s/\]\]//' | sort -u); do
  [ -f "memories/$l.md" ] || note "broken link [[$l]] (no memories/$l.md)"
done

echo "3. index completeness (each memory in BOTH README.md and MEMORY.md)"
for f in memories/*.md; do
  grep -Fq "($f)" README.md || note "$f: not linked from README.md"
  grep -Fq "($f)" MEMORY.md || note "$f: not linked from MEMORY.md"
done

echo "4. yaml frontmatter parses (GitHub rejects invalid YAML — e.g. an unquoted"
echo "   description with an interior ': ')"
if command -v ruby >/dev/null 2>&1; then
  yaml_errs=$(ruby -ryaml -e '
    Dir.glob("memories/*.md").sort.each do |f|
      lines = File.readlines(f)
      next unless lines[0] && lines[0].strip == "---"
      endi = lines[1..].index { |l| l.strip == "---" }
      (puts "#{f}: no closing --- in frontmatter"; next) if endi.nil?
      begin
        YAML.safe_load(lines[1, endi].join)
      rescue => e
        puts "#{f}: #{e.message.lines.first.strip}"
      end
    end')
  if [ -n "$yaml_errs" ]; then
    while IFS= read -r line; do note "$line"; done <<< "$yaml_errs"
  fi
else
  echo "  (ruby not found — YAML check skipped)"
fi

if [ "$fail" -eq 0 ]; then
  echo "✅ all checks passed ($(ls memories/*.md | wc -l | tr -d ' ') memories)"
else
  echo "✗ drift-gate failed — fix the ❌ items above."
fi
exit "$fail"
