Basic Rails Single Table Inheritance (STI).


# Rails console samples
mac = Mac.create owner: 'Alec'
MightyMouse.create computer_id: mac.id, maker: 'Apple', model: 'MM1', scroller: 'awesome'


params = {
  computer: {
    type: 'Mac',
    owner: 'Alec',

    keyboard_attributes: {
      maker: 'Logitech',
      model: 'Lv101'
    }
  }
}
Computer.create(params[:computer])


params = {
  mac: {
    owner: 'Tube',

    keyboard_attributes: {
      maker: 'Apple',
      model: 'Silver'
    }
  }
}
Mac.create(params[:mac])


params = {
  mac: {
    owner: 'V1',

    mouse_attributes: {
      type: 'MightyMouse',
      maker: 'Apple',
      model: 'Mighty1',
      scroller: 'awesome'
    }
  }
}
Mac.create(params[:mac])

# Now you can use this
Mac.first
Mac.first.class
Mac.first.mouse
Mac.first.mouse.class

# Instead of doing this
computer = Computer.first
computer = computer.type.constantize.find(computer.id)

# If FormObjects work or enable relations in Computer model
params = {
  mac: {
    owner: 'V1',

    razer_attributes: {
      maker: 'Razer',
      model: 'Awesome Razer 2314',
      buttons: 15
    }
  }
}
Mac.create(params[:mac])

params = {
  mac: {
    owner: 'V1',

    mighty_mouse_attributes: {
      maker: 'Apple',
      model: 'Mighty mighty mouse',
      scroller: 'awesome'
    }
  }
}
Mac.first.update(params[:mac])

params = {
  mac: {
    razer_attributes: {
      buttons: 12
    }
  }
}
Mac.first.update(params[:mac])
