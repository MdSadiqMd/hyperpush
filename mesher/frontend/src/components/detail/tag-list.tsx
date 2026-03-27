interface TagListProps {
  tags: Record<string, string> | null | undefined;
}

export function TagList({ tags }: TagListProps) {
  if (!tags || Object.keys(tags).length === 0) {
    return (
      <p className="text-sm text-muted-foreground italic">No tags</p>
    );
  }

  const entries = Object.entries(tags);

  return (
    <div className="grid grid-cols-1 gap-px sm:grid-cols-2 bg-border rounded-lg overflow-hidden">
      {entries.map(([key, value]) => (
        <div
          key={key}
          className="flex items-baseline gap-2 bg-background px-3 py-2 min-w-0 hover:bg-card transition-colors"
        >
          <span className="text-[10px] font-mono text-muted-foreground shrink-0">
            {key}
          </span>
          <span className="font-mono text-xs truncate text-foreground">{value}</span>
        </div>
      ))}
    </div>
  );
}
