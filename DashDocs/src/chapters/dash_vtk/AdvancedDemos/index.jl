@doc_chapter "/dash_vtk/advanced_demos" begin 

@example advanceddemos_synthetic_volume_rendering "synthetic_volume_rendering.jl"

    @layout html_div() do 
    
        html_h1("Advanced Demos"),
    
        dcc_markdown("
           `DashVtk` provides several advanced examples that should re-enforce what has been described so far. We have made some examples using `DashVTK` and `Dash` for both a CFD example and some medical ones.
        "),

        html_h3("Synthetic Volume Rendering")

        dcc_markdown("This example aims to show how do volume rendering of a synthetic image data by only providing the grid information and values."),

        source"advanceddemos_synthetic_volume_rendering",
        layout"advanceddemos_synthetic_volume_rendering"
    
    end
    
    end