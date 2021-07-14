using Dash, DashBio

app = dash()

app.layout = dashbio_igv(
  id="reference-igv",
  reference=Dict(
      "id" => "ASM985889v3",
      "name" => "Sars-CoV-2 (ASM985889v3)",
      "fastaURL" => "https://s3.amazonaws.com/igv.org.genomes/covid_ASM985889v3/GCF_009858895.2_ASM985889v3_genomic.fna",
      "indexURL" => "https://s3.amazonaws.com/igv.org.genomes/covid_ASM985889v3/GCF_009858895.2_ASM985889v3_genomic.fna.fai",
      "order" => 1000000,
      "tracks" => [
          Dict(
              "name" => "Annotations",
              "url" => "https://s3.amazonaws.com/igv.org.genomes/covid_ASM985889v3/GCF_009858895.2_ASM985889v3_genomic.gff.gz",
              "displayMode" => "EXPANDED",
              "nameField" => "gene",
              "height" => 150,
              "color" => "rgb(176,141,87)"
          )
      ]
  ),
) 

run_server(app, "0.0.0.0", debug=true)