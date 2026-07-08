project "ImGui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("../../bin/" .. outputdir .. "/%{prj.name}")
    objdir ("../../bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "imgui.cpp",
        "imgui_demo.cpp",
        "imgui_draw.cpp",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",

        "backends/imgui_impl_opengl3.cpp",
        "backends/imgui_impl_glfw.cpp",

        "*.h",
        "backends/*.h"
    }

    includedirs
    {
        ".",
        "../GLFW/include"
    }

    links
    {
        "GLFW",
        "GL",
        "dl",
        "pthread"
    }

    filter "system:linux"
        systemversion "latest"
        pic "On"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"