require 'rails_helper'

describe Todo do
  it 'can be completed' do
    todo = Todo.new

    todo.complete!

    expect(todo.completed?).to eq(true)
  end

  it 'can be uncompleted' do
    todo = Todo.new
    todo.completed = false

    todo.uncomplete!

    expect(todo.completed?).to eq(false)
  end
end