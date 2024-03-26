
function Person(name, age) {
    this.name = name;
    this.age = age;
}

// add a function greet to the Person prototype
Person.prototype.greet = function() {
    return "Hello, my name is " + this.name + " and I am " + this.age + " years old!";
}


module.exports = {
    Person: Person
};