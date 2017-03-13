var count = 0
var gene_count = 0
var chrom_count = 0
var pheno_count = 0

function addPopulation() {
    count += 1

    var newdiv = document.createElement("div")
    newdiv.id = 'pop'+count
    newdiv.className = 'form-group'
    newdiv.style = 'margin:5px'

    newdiv.appendChild(createInput('population', 'text', 'population-'+count))
    newdiv.appendChild(createInput('birth', 'number', 0))
    newdiv.appendChild(createInput('initial_size', 'number', 1000))
    newdiv.appendChild(createInput('carrying_capacity', 'number', 3000))
    newdiv.appendChild(createInput('growth_rate', 'number', 0.525))
    newdiv.appendChild(createInput('death', 'number', 20000))

    var mydiv = document.getElementById("population")
    mydiv.appendChild(newdiv)
}

function addChromosome() {
    chrom_count += 1

    var newdiv = document.createElement("div")
    newdiv.id = 'chrom' + chrom_count
    newdiv.className = 'form-group'
    newdiv.style = 'margin:5px'

    newdiv.appendChild(createLabel('&#8678; length'))
    newdiv.appendChild(createInput('length', 'number', 4000000))
    newdiv.appendChild(createAnchor('javascript:addGene(' + newdiv.id + ')', '<span style="color:#080" class="glyphicon glyphicon-plus-sign"></span>'))

    var mydiv = document.getElementById("chromosome")
    mydiv.appendChild(newdiv)
}

function addPhenotype() {
    var newdiv = document.createElement("div")
    newdiv.id = 'pop' + count
    newdiv.className = 'form-group'
    newdiv.style = 'margin:5px'

    pheno_count += 1

    newdiv.appendChild(createInput('pheno_name', 'text', 'pheno' + pheno_count))

    if (pheno_count % 2 == 0) {
        newdiv.appendChild(createInput('pheno_def', 'text', 'ABC1 + ABC2 * ifMale + 0.3 * ifFemale', 'width:600px; margin:5px'))
    } else {
        newdiv.appendChild(createInput('pheno_def', 'text', '(3.0 * ABC1) + ((ABC2 / 2.0) / 2.0) # * environment + 2.0 * familyEnvironment', 'width:600px; margin:5px'))
    }

    var mydiv = document.getElementById("phenotype")
    mydiv.appendChild(newdiv)
}

function addGene(mydiv) {
    var newdiv = document.createElement("div")
    newdiv.id = 'pop' + count
    newdiv.className = 'form-group'
    newdiv.style = 'margin:5px'

    gene_count += 1

    newdiv.appendChild(createInput('gene_name', 'text', 'ABC' + gene_count))
    newdiv.appendChild(createInput('gene_location', 'number', 10000))
    newdiv.appendChild(createInput('gene_gamma', 'text', "[1, 0.05, 1, 0.01]"))
    newdiv.appendChild(createInput('gene_probabilityNoEffect', 'number', 0.6))
    newdiv.appendChild(createInput('gene_probabilityPositiveEffect', 'number', 0.3))

    mydiv.appendChild(newdiv)
}

function createInput(name, type, value, style='width:150px; margin:5px') {
    input = document.createElement('input')
    input.type = type
    input.name = name
    input.placeholder = name
    input.value = value
    input.style = style
    input.className = 'form-control col-xs-3'
    return input
}

function createAnchor(href, text) {
    var a = document.createElement('a')
    a.setAttribute('href', href)
    a.className = 'btn btn-link'
    a.innerHTML = text
    return a
}

function createLabel(text) {
    var label = document.createElement('label')
    label.innerHTML = text
    label.addClass = "control-label"
    return label
}

function updateScript() {
    script = document.getElementById("input_script")
    form = document.input_form
    lb = '&#xA;'
    buf = "global begin" + lb + lb
    buf += "generations " + form.generations.value + lb
    buf += "setFertility poisson " + form.set_fertility_poisson.value + lb
    buf += "setMaxOffspringNumber " + form.set_max_offspring_number.value + lb
    buf += "prevalence relative " + form.prevalence_relative.value + lb
    buf += "mutation rate " + form.mutation_rate_male.value + " male" + lb
    buf += "mutation rate " + form.mutation_rate_female.value + " female" + lb
    buf += "output " + form.output.value + lb
    buf += form.megabases_per_centimorgan_male.value + " megabases per centiMorgan male"+ lb
    buf += form.megabases_per_centimorgan_female.value + " megabases per centiMorgan female " + lb
    if (form.mating_with_replacement.value) {
        buf += "matingWithReplacement true " + lb
    }
    buf += "finalPedigreeDepth " + form.final_pedigree_depth.value + lb
    if (form.using_track_snps.value) {
        buf += "usingTrackSNPs true " + lb
    }
    if (form.output_xml.value) {
        buf += "outputXML true " + lb
    }
    if (form.output_svg.value) {
        buf += "outputSVG true " + lb
    }
    buf += lb
    buf += "end"
    script.innerHTML = buf
}
