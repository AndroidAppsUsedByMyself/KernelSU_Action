#!/usr/bin/env bash

branches=(
  "Lineage_pstar_with_KernelSU_Next"
  "Lineage_pstar_with_backslashxx_KernelSU"
  "Lineage_pstar_with_official_KernelSU"
  "Lineage_pstar_with_rsuntk_KernelSU"
)

for branch in "${branches[@]}"; do
  if git show-ref --verify --quiet refs/remotes/origin/"$branch"; then
    git checkout -b "$branch" origin/"$branch" 2>/dev/null || git checkout "$branch"
    
    git branch --set-upstream-to=origin/"$branch" "$branch"
    
    echo "Tracked branch '$branch' to 'origin/$branch'."
  else
    echo "Remote branch 'origin/$branch' does not exist. Skipping."
  fi
done

echo "Branch tracking setup complete."