import { Button } from "@/components/ui/button";
import { ChevronLeft, ChevronRight } from "lucide-react";

interface PaginationProps {
  hasMore: boolean;
  hasPrevious: boolean;
  onNext: () => void;
  onPrevious: () => void;
}

export function Pagination({
  hasMore,
  hasPrevious,
  onNext,
  onPrevious,
}: PaginationProps) {
  if (!hasMore && !hasPrevious) return null;

  return (
    <div className="flex items-center justify-center gap-2">
      <Button
        variant="outline"
        size="sm"
        className="h-8 gap-1 font-mono text-xs"
        onClick={onPrevious}
        disabled={!hasPrevious}
      >
        <ChevronLeft className="size-3.5" />
        Previous
      </Button>
      <Button
        variant="outline"
        size="sm"
        className="h-8 gap-1 font-mono text-xs"
        onClick={onNext}
        disabled={!hasMore}
      >
        Next
        <ChevronRight className="size-3.5" />
      </Button>
    </div>
  );
}
