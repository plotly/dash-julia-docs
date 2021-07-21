@doc_chapter "/dash_vtk" begin


@layout html_div() do 

    html_h1("Dash VTK"),

    dcc_markdown("
    Dash is a web application framework that provides pure julia abstraction around HTML, CSS, and JavaScript. So here Dash VTK aims to integrate `VTK/vtk.js` visualization into the Dash framework. [VTK](https://vtk.org/) stands for Visualization Toolkit and is popular library written in C++ which is also available in Julia for doing data processing and visualization in the scientific and medical fields. Typically VTK is used to visualize 3D geometries from simulatuions or sensors such as LIDAR scanner. For the medical world, VTK is used to render 3D images (i.e. CT, MRI, ...) by doing volume rendering and/or slicing. 

    [Vtk.js](https://kitware.github.io/vtk-js/) on the other hand is a subset of VTK that focuses on the rendering aspect of it but in t JavaScript world. Vtk.js takes the same architecture and object decomposition as its big brother VTK/C++ but makes it friendly to use inside your browser. 

    Dash VTK enables its user to use VTK on the server side for any data processing and provides the infrastructure to push the visualization to the client side for a better experience. Dash VTK does not require VTK but can seamlessly leverage it for looking at point clouds, a CFD simulation or anything 3D mesh or 3D images related.

    These docs are using DashVtk version $(pkgver"DashVtk").
    To install DashVtk in your computer go to your julia terminal and perform following step: 
    ```
    pkg> add DashVTK
    ```
    It will install the following dependency in your local environment. 
    ")
end