@doc_chapter "/dash_data_table/height" begin

  @layout html_div() do
  
      html_h1("DataTable Height"),
      dcc_markdown("""
      By default, the table's height will expand in order to render up to 250 rows. After 250 rows, the table will display a pagination UI which enables viewing of up to 250 rows at a time.
      """),

      html_h3("Setting Table Height with Pagination"),
      dcc_markdown("""
      If you are using pagination, you can control the 
      height by displaying fewer rows at a time. Instead of
       250 rows, you could display 10 rows at a time. By
        default and without wrapping, each row takes up 30px.
         So 10 rows with one header would set the table to be
          330px tall. The pagination UI itself is around 60px
           tall.
      """)
  end
  
  end