function addPopulation() {
    var mydiv = document.getElementById("population")
    var newdiv = document.createElement("div")
    newdiv.id = 'new_pop'
    newdiv.className = 'form-group'

    newdiv.appendChild(createInputText('population', 'populationA'))
    newdiv.appendChild(createInputText('birth', 0))
    newdiv.appendChild(createInputText('initial_size', 1000))
    newdiv.appendChild(createInputText('carrying_capacity', 3000))
    newdiv.appendChild(createInputText('growth_rate', 0.525))
    newdiv.appendChild(createInputText('death', 20000))

    mydiv.appendChild(newdiv)
}


function createInputText(name, value) {
    input = document.createElement('input')
    input.type = 'text'
    input.name = name
    input.placeholder = name
    input.value = value
    input.className = 'form-control col-xs-3'
    return input
}
