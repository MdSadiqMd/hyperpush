import { NavLink } from "react-router";
import {
  LayoutDashboard,
  CircleDot,
  List,
  Radio,
  Bell,
  Settings,
  ChevronsUpDown,
} from "lucide-react";
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarSeparator,
} from "@/components/ui/sidebar";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { useProjectStore } from "@/stores/project-store";

const navItems = [
  { label: "Dashboard", path: "/dashboard", icon: LayoutDashboard },
  { label: "Issues", path: "/issues", icon: CircleDot },
  { label: "Events", path: "/events", icon: List },
  { label: "Live Stream", path: "/live", icon: Radio },
  { label: "Alerts", path: "/alerts", icon: Bell },
  { label: "Settings", path: "/settings", icon: Settings },
] as const;

export function AppSidebar() {
  const projects = useProjectStore((s) => s.projects);
  const activeProjectId = useProjectStore((s) => s.activeProjectId);
  const setActiveProject = useProjectStore((s) => s.setActiveProject);

  const activeProject = projects.find((p) => p.id === activeProjectId);

  return (
    <Sidebar>
      <SidebarHeader className="border-b border-sidebar-border px-4 py-3">
        <div className="flex items-center gap-2.5">
          <div className="flex h-7 w-7 items-center justify-center rounded-md bg-accent/10">
            <span className="text-sm font-bold text-accent">M</span>
          </div>
          <div className="flex flex-col">
            <span className="text-sm font-semibold tracking-tight">
              Mesher
            </span>
            <span className="text-[10px] font-mono text-muted-foreground">
              Error Tracking
            </span>
          </div>
        </div>
      </SidebarHeader>

      <SidebarContent>
        {/* Project switcher */}
        <SidebarGroup>
          <SidebarGroupLabel className="text-[10px] font-mono uppercase tracking-wider text-muted-foreground">
            Project
          </SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu>
              <SidebarMenuItem>
                <DropdownMenu>
                  <DropdownMenuTrigger asChild>
                    <SidebarMenuButton className="justify-between">
                      <span className="truncate text-sm">
                        {activeProject?.name ?? "Select project"}
                      </span>
                      <ChevronsUpDown className="h-3.5 w-3.5 text-muted-foreground" />
                    </SidebarMenuButton>
                  </DropdownMenuTrigger>
                  <DropdownMenuContent
                    className="w-[--radix-dropdown-menu-trigger-width]"
                    align="start"
                  >
                    <DropdownMenuLabel className="text-[10px] font-mono uppercase tracking-wider text-muted-foreground">
                      Projects
                    </DropdownMenuLabel>
                    <DropdownMenuSeparator />
                    {projects.map((project) => (
                      <DropdownMenuItem
                        key={project.id}
                        onClick={() => setActiveProject(project.id)}
                        className={
                          project.id === activeProjectId
                            ? "bg-accent/10 text-accent"
                            : ""
                        }
                      >
                        <span className="truncate">{project.name}</span>
                      </DropdownMenuItem>
                    ))}
                    {projects.length === 0 && (
                      <DropdownMenuItem disabled>
                        <span className="text-muted-foreground">
                          No projects
                        </span>
                      </DropdownMenuItem>
                    )}
                  </DropdownMenuContent>
                </DropdownMenu>
              </SidebarMenuItem>
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>

        <SidebarSeparator />

        {/* Navigation */}
        <SidebarGroup>
          <SidebarGroupLabel className="text-[10px] font-mono uppercase tracking-wider text-muted-foreground">
            Navigation
          </SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu>
              {navItems.map((item) => (
                <SidebarMenuItem key={item.path}>
                  <SidebarMenuButton asChild>
                    <NavLink
                      to={item.path}
                      className={({ isActive }) =>
                        isActive
                          ? "font-medium bg-accent/10 text-accent"
                          : "text-muted-foreground hover:text-foreground"
                      }
                    >
                      <item.icon className="h-4 w-4" />
                      <span>{item.label}</span>
                    </NavLink>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>

      <SidebarFooter className="border-t border-sidebar-border px-4 py-3">
        <div className="flex items-center gap-2">
          <div className="h-2 w-2 rounded-full bg-accent animate-pulse" />
          <span className="text-[10px] font-mono text-muted-foreground">
            v0.1.0
          </span>
        </div>
      </SidebarFooter>
    </Sidebar>
  );
}
