Basic Rails Single Table Inheritance (STI).


# Rails console samples

Create one Basic:

    mac = Mac.create owner: 'Alec'
    MightyMouse.create computer_id: mac.id, maker: 'Apple', model: 'MM1', scroller: 'awesome'

Another:

    pc = Pc.create owner: 'Alice'

When you try to list it down, it would know what the actual records are:

    Computer.all
    # => #<ActiveRecord::Relation [#<Mac id: 17, type: "Mac", owner: "Alec">, #<Pc id: 18, type: "Pc", owner: "Alice">]>

Using first level accepts_nested_attributes for:

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

Another example:

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

# If you enable relations in Computer model or if my I could make FormObjects work
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
        razer_attributes: {
          model: 'Awesome Razer 1112',
          buttons: 12
        }
      }
    }
    Mac.first.update(params[:mac])

Another example

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