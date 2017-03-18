var count = 0
var gene_count = 0
var chrom_count = 0
var pheno_count = 0
var event_count = 0

function correctSciNotation(obj) {
    obj.value = obj.value.replace(/[eE]/, " E ")
}

function addEvent() {
    event_count += 1

    var newdiv = document.createElement("div")
    newdiv.id = 'event' + event_count
    newdiv.className = 'form-group'
    newdiv.style = 'margin:5px'
    var gen = document.getElementById('generation').value

    var e = document.getElementById("evnt")
    var evnt = e.options[e.selectedIndex].value

    var arg = {};

    arg.serializeState = ""
    arg.printGeneration = ""
    arg.mutation = "2.5 E -08"
    arg.donateParents = "PopulationA PopulationB 250 250"
    arg.outputXML = "true"
    arg.setCarryingCapacity = "PopulationA 3000"
    arg.setEnvironmentNormal = "PopulationA pheno1 mean variance"
    arg.setFertility = "PopulationA poisson mean"
    arg.setMatingPopMatrix = "PopulationA 95 5 0"
    arg.setMaxOffspringNumber = "PopulationA 8"
    arg.setPhenotypeSelection = "PopulationA pheno1 relative -1.0 2.5"

    eid = 'event' + event_count
    newdiv.appendChild(createInput(eid+'gen', 'number', gen))
    newdiv.appendChild(createInput(eid+'action', 'text', evnt, 'width:300px;margin:5px'))
    if (arg[evnt]) {
        newdiv.appendChild(createInput(eid+'args', 'text', arg[evnt], 'width:400px;margin:5px'))
    }

    var mydiv = document.getElementById("events")
    mydiv.appendChild(newdiv)
}

function addPopulation() {
    count += 1

    var newdiv = document.createElement("div")
    newdiv.id = 'pop' + count
    newdiv.className = 'form-group'
    newdiv.style = 'margin:5px'

    pop_name = "Population" + String.fromCharCode(64  + count)
    newdiv.appendChild(createInput('pop_name', 'text', pop_name))
    newdiv.appendChild(createInput('pop_birth', 'number', 0))
    newdiv.appendChild(createInput('pop_init_size', 'number', 1000))
    newdiv.appendChild(createInput('pop_carrying_capacity', 'number', 3000))
    newdiv.appendChild(createInput('pop_growth_rate', 'number', 0.525))
    newdiv.appendChild(createInput('pop_death', 'number', 20000))

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
    newdiv.appendChild(createInput('chrom_length', 'number', 40000000))
    newdiv.appendChild(createAnchor('javascript:addGene(' + newdiv.id + ')', '<span style="color:#080" class="glyphicon glyphicon-plus-sign"></span>'))

    var mydiv = document.getElementById("chromosome")
    mydiv.appendChild(newdiv)
}

function addPhenotype() {
    pheno_count += 1

    var newdiv = document.createElement("div")
    newdiv.id = 'pheno' + pheno_count
    newdiv.className = 'form-group'
    newdiv.style = 'margin:5px'

    // console.log(pheno_count)

    newdiv.appendChild(createInput('pheno_name', 'text', 'pheno' + pheno_count))
    newdiv.appendChild(createInput('pheno_def', 'text', 'ABC1', 'width:600px; margin:5px'))

    var mydiv = document.getElementById("phenotype")
    mydiv.appendChild(newdiv)
}

function addGene(mydiv) {
    gene_count += 1

    var newdiv = document.createElement("div")
    newdiv.id = 'gene' + gene_count
    newdiv.className = 'form-group'
    newdiv.style = 'margin:5px'

    gene_location = (gene_count+2)*1E6

    newdiv.appendChild(createInput('gene_name', 'text', 'ABC' + gene_count))
    newdiv.appendChild(createInput('gene_location', 'number', gene_location))
    newdiv.appendChild(createInput('gene_length', 'number', 25000))
    newdiv.appendChild(createInput('gene_gamma', 'text', "1 0.05 1 0.01"))
    newdiv.appendChild(createInput('gene_probability_no_effect', 'number', 0.6))
    newdiv.appendChild(createInput('gene_probability_pos_effect', 'number', 0.3))

    mydiv.appendChild(newdiv)
}

function createInput(name, type, value, style='width:150px; margin:5px') {
    input = document.createElement('input')
    input.type = type
    input.id = name
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
    lb = "&#xA;"

    buf = "global begin" + lb
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
    if (form.using_track_snps.checked) {
        buf += "usingTrackSNPs true " + lb
    }
    if (form.output_xml.checked) {
        buf += "outputXML true " + lb
    }
    if (form.output_svg.checked) {
        buf += "outputSVG true " + lb
    }

    // events
    var events = $('#events').children('div')

    for( i=1; i< events.length; i++ )
    {
        var evnt = events[i]
        buf += "event"
        var event_inputs = $('#'+evnt.id).children('div > input')
        for (k = 0; k < event_inputs.length; k++) {
            char = event_inputs[k]
            buf += " " + char.value
        }
        buf += lb
    }

    buf += "end" + lb + lb

    var chromosomes = $('#chromosome').children('div')

    for( i=0; i< chromosomes.length; i++ )
    {
     var chromosome = chromosomes[i]
     // console.log(chromosome)
     // chromosome
     buf += "chromosome begin" + lb
     var selector = '#'+chromosome.id

     // surely there is a better way to do this
     var chrome_length = $(selector).children('input')[0].value
     buf += "length " + chrome_length + lb + lb

     var selector = '#'+chromosome.id
     var genes = $(selector).children('div')
     label = ["name ", "location ", "length ", "gamma ", "probabilityNoEffect ", "probabilityPositiveEffect "]

     for (j = 0; j< genes.length; j++) {
        gene = genes[j]
        var gene_chars = $('#'+gene.id).children('input')

        buf += "gene begin" + lb

        for (k = 0; k < gene_chars.length; k++) {
            char = gene_chars[k]
            buf += label[k] + char.value + lb
        }
        buf += "end" + lb + lb
     }
     buf += "end" + lb + lb

    }

    var phenotypes = $('#phenotype').children('div')
    var pheno_label = ["name ", "definition "]

    for( i=0; i < phenotypes.length; i++ )
    {
        buf += "phenotype begin" + lb
        var pheno = phenotypes[i];
        // console.log(pheno)
        var pheno_inputs = $('#'+pheno.id).children('input')
        for (k = 0; k < pheno_inputs.length; k++) {
            char = pheno_inputs[k]
            buf += pheno_label[k] + char.value + lb
        }
        buf += "end" + lb + lb
    }

    var populations = $('#population').children('div')
    var pop_label = ["name ", "birth ", "carryingCapacity ", "initialSize ", "growthRate ", "death "]

    for( i=0; i< populations.length; i++ )
    {
        buf += "population begin" + lb
        var population = populations[i];
        var pop_inputs = $('#'+population.id).children('input')
        for (k = 0; k < pop_inputs.length; k++) {
            char = pop_inputs[k]
            buf += pop_label[k] + char.value + lb
        }
        buf += "selection PhenotypeA relative -4.8 4.8" + lb
        buf += "environmentNormal PhenotypeA 0.0 1.0" + lb
        buf += "mateCutoff internal PhenotypeA -4.8 4.8" + lb
        buf += "mateCutoff external PhenotypeA -4.8 4.8" + lb
        if (populations.length > 1) {
            buf += "selection PhenotypeB relative -4.8 4.8" + lb
            buf += "environmentNormal PhenotypeB 0.0 1.0" + lb
            buf += "mateCutoff internal PhenotypeB -4.8 4.8" + lb
            buf += "mateCutoff external PhenotypeB -4.8 4.8" + lb
        }
        buf += "end" + lb + lb
    }

    script.innerHTML = buf

    // $.notify("updated script")
}
