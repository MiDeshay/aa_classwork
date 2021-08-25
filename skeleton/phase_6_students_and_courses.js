function Student(first, last) {
  this.firstName = first; 
  this.lastName = last;
  this.courses = [];
}

function Course(name, dept, credits) {
  this.name = name;
  this.dept = dept; 
  this.credits = credits;
  this.students = []; 
}

Student.prototype.name = function() {
  return `${this.firstName} ${this.lastName}`;
}

Student.prototype.enroll = function(course) {
  this.courses.push(course.name);
  course.students.push(this.name())
  return course.students
  // return this.courses
}

// Student.prototype.courseLoad = function()



maisie = new Student("maisie", "bruno-tyne")
coding = new Course("coding", "cs", "2")
console.log(maisie.enroll(coding))