<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { Droplets, Cog, Gauge } from 'lucide-vue-next'
import { useScrollReveal } from '@/composables/useScrollReveal'

const { observe } = useScrollReveal()
const cards = ref<HTMLElement[]>([])

const comparisons = [
  {
    icon: Droplets,
    label: 'vs Elixir',
    tagline: 'Static types, native speed',
    description:
      'Mesh shares Elixir\'s actor model and let-it-crash philosophy, but adds static types with full inference. No runtime type errors, no dialyzer setup, and it compiles to native binaries instead of running on the BEAM.',
    pros: ['Type inference', 'Native binaries', 'Familiar model'],
  },
  {
    icon: Cog,
    label: 'vs Rust',
    tagline: 'Simpler concurrency',
    description:
      'Mesh provides Rust-level native performance without borrow checking complexity. Mesh uses per-actor garbage collection instead of ownership, making concurrent code dramatically simpler to write.',
    pros: ['No borrow checker', 'Per-actor GC', 'Actor supervision'],
  },
  {
    icon: Gauge,
    label: 'vs Go',
    tagline: 'More expressive',
    description:
      'Like Go, Mesh compiles to fast native binaries with lightweight concurrency. But Mesh adds pattern matching, algebraic types, type inference, and supervision trees — making it more expressive and fault-tolerant.',
    pros: ['Pattern matching', 'Sum types', 'Supervision trees'],
  },
]

onMounted(() => {
  cards.value.forEach((el) => {
    if (el) observe(el)
  })
})
</script>

<template>
  <section class="relative border-t border-border py-20 md:py-28">
    <div class="mx-auto max-w-5xl px-4">
      <!-- Section header -->
      <div class="text-center">
        <div class="text-sm font-mono uppercase tracking-widest text-muted-foreground">Comparison</div>
        <h2 class="mt-3 text-3xl font-bold tracking-tight text-foreground sm:text-4xl lg:text-5xl">
          Why Mesh?
        </h2>
        <p class="mx-auto mt-4 max-w-lg text-lg text-muted-foreground">
          Mesh sits at a unique intersection in the programming language landscape.
        </p>
      </div>

      <div class="mt-14 grid gap-5 md:grid-cols-3">
        <div
          v-for="(comparison, index) in comparisons"
          :key="comparison.label"
          :ref="(el) => { if (el) cards[index] = el as HTMLElement }"
          class="reveal group rounded-xl border border-border bg-card p-7 transition-all duration-300 hover:-translate-y-1 hover:border-foreground/20 hover:shadow-xl"
          :class="`reveal-delay-${index + 1}`"
        >
          <div class="mb-5 flex size-11 items-center justify-center rounded-xl bg-foreground/[0.06] dark:bg-foreground/[0.08] text-foreground transition-colors group-hover:bg-foreground/[0.1]">
            <component :is="comparison.icon" class="size-5" :stroke-width="1.75" />
          </div>

          <div class="inline-flex items-center rounded-md bg-foreground text-background px-3 py-1.5 text-sm font-bold">
            {{ comparison.label }}
          </div>
          <p class="mt-1.5 text-xs font-medium text-muted-foreground">{{ comparison.tagline }}</p>

          <p class="mt-4 text-sm leading-relaxed text-muted-foreground">
            {{ comparison.description }}
          </p>

          <!-- Advantage tags -->
          <div class="mt-5 flex flex-wrap gap-1.5">
            <span
              v-for="pro in comparison.pros"
              :key="pro"
              class="inline-flex items-center rounded-md bg-muted px-2 py-0.5 text-[11px] font-medium text-muted-foreground"
            >
              {{ pro }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
