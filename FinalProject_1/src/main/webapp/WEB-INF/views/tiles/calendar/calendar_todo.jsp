<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    
<%@ include file="calendar_header.jsp"%>    


<style type="text/css">  
	 
.container {
	display: block; 
	width: 400px; 
	margin: -20px auto 100px;
	background-color:#fff;
	padding:0px 10px 10px 10px;
	border-radius:10px
}

h2 {
	text-align:center;
	padding-top:10px;
	margin-bottom:0px;
}

ul {
	margin: 0;
	padding: 0;
}

li * {
	float: left;
}
.todo_li{
 
	border-bottom: 1px solid #eee;
    width: 538px;
} 

li,
h3 {
	clear: both;
	list-style: none;
} 

input,
button {
	outline: none;
}
 
button {
	background: none;
	border: 0px; 
	font-size: 15px; 
	width: 60px; 
	margin: 10px 0 0; 
	cursor: pointer;
}
  
button:hover {  
	color: white;    
	opacity: 50%; 
} 
.ok_btn{  
   font-size: 9pt;  
   border: none; 
   border-radius: 10px;
   width: 64px;     
   height: 43px;
   background-color: #5F98F6;
   color: white;
   margin-left: 5px;
} 

.edit{ 
   font-size: 9pt;
   border: none;   
   border-radius: 10px;
   width: 54px;
   height: 26px;
   background-color: #5F98F6;
   color: white;
   float: right;   
   margin-right: 4px; 
 }
  
 .delete{ 
   font-size: 9pt;
   border: none; 
   border-radius: 10px;
   width: 54px;  
   height: 26px;
   background-color: #b4b4b4;
   color: white;
   float: right;  
 
 }
 

/* Heading */ 

h3, 
label[for='new-task'] {
	color: #333;
	font-weight: 700; 
	font-size: 18px;
	border-bottom: 2px solid #333;
	padding: 50px 0 10px;
	margin: 0;
	text-transform: uppercase;
	width: 90%;
}

input[type="text"] {
	margin-top: 10px; 
	font-size: 18px; 
	line-height: 18px;
	height: 18px;
	padding: 10px;
	border: 1px solid #ddd;
	background: #fff; 
	border-radius: 6px;
	color: #888;
} 

input[type="text"]:focus {
	color: black; 
}

 
/* New Task */
 
label[for='new-task'] { 
	display: block;
	margin: 0 0 20px;
}

input#new-task {
	float: left;
	width: 1087px;
    height: 44px; 
}
    
p > button:hover {
	 
} 

 
/* Task list */ 

li {
	overflow: hidden;
	padding: 20px 0; 
/* 	border-bottom: 1px solid #eee; */
}

li > input[type="checkbox"] {
	margin: 0 10px;
	position: relative;
	top: 15px;
}
  
li > label {
	font-size: 18px;  
	line-height: 40px;
	width: 383px;    
	padding: 0 0 0 11px;
}

li > input[type="text"] {
	width: 226px;
}
 
li > .delete:hover {
	color: #ed0000;
} 


/* Completed */

#completed-tasks label {
	text-decoration: line-through;
	color: #888;
}


/* Edit Task */

ul li input[type=text] {
	display: none;
}

ul li.editMode input[type=text] {
	display: block;
}

ul li.editMode label {
	display: none;
}  
     
</style> 
    
<script type="text/javascript">  


//todo 시작

var taskInput = document.getElementById("new-task"); //new-task 
var addButton = document.getElementsByTagName("button")[0]; //first button
var incompleteTasksHolder = document.getElementById("incomplete-tasks"); //incomplete-tasks
var completedTasksHolder = document.getElementById("completed-tasks"); //completed-tasks

//New Task List Item
var createNewTaskElement = function(taskString) {
	//Create List Item
	var listItem = document.createElement("li"); 
 
	//input (checkbox)
	var checkBox = document.createElement("input"); // checkbox
	//label
	var label = document.createElement("label");
	//input (text)
	var editInput = document.createElement("input"); // text
	//button.edit
	var editButton = document.createElement("button");
	//button.delete
	var deleteButton = document.createElement("button");

	//Each element needs modifying

	checkBox.type = "checkbox";
	editInput.type = "text";

	editButton.innerText = "수정";
	editButton.className = "edit";
	deleteButton.innerText = "삭제";
	deleteButton.className = "delete";

	label.innerText = taskString;

	//Each element needs appending
	listItem.appendChild(checkBox);
	listItem.appendChild(label);
	listItem.appendChild(editInput);
	listItem.appendChild(editButton);
	listItem.appendChild(deleteButton);

	return listItem;
}

//Add a new task
var addTask = function() {
	console.log("Add task...");
	//Create a new list item with the text from #new-task:
	var listItem = createNewTaskElement(taskInput.value);
	//Append listItem to incompleteTasksHolder
	incompleteTasksHolder.appendChild(listItem);
	bindTaskEvents(listItem, taskCompleted);

	taskInput.value = "";
}

//Edit an existing task
var editTask = function() {
	console.log("Edit task...");

	var listItem = this.parentNode;

	var editInput = listItem.querySelector("input[type=text");
	var label = listItem.querySelector("label");

	var containsClass = listItem.classList.contains("editMode");

	//if the class of the parent is .editMode
	if (containsClass) {
		//Switch from .editMode
		//label text become the input's value
		label.innerText = editInput.value;
	} else {
		//Switch to .editMode
		//input value becomes the label's text
		editInput.value = label.innerText;
	}

	//Toggle .editMode on the list item 
	listItem.classList.toggle("editMode");

}

//Delete an existing task
var deleteTask = function() {
	console.log("Delete task...");
	var listItem = this.parentNode;
	var ul = listItem.parentNode;

	//Remove the parent list item from the ul
	ul.removeChild(listItem);
}

//Mark a task as complete
var taskCompleted = function() {
	console.log("Task complete...");
	//Append the task list item to the #completed-tasks
	var listItem = this.parentNode;
	completedTasksHolder.appendChild(listItem);
	bindTaskEvents(listItem, taskIncomplete);
}

//Mark a task as incomplete
var taskIncomplete = function() {
	console.log("Task incomplete...");
	//Append the task list item to the #incomplete-tasks
	var listItem = this.parentNode;
	incompleteTasksHolder.appendChild(listItem);
	bindTaskEvents(listItem, taskCompleted);
}

var bindTaskEvents = function(taskListItem, checkBoxEventHandler) {
	console.log("Bind list item events");
	//select taskListItem's children
	var checkBox = taskListItem.querySelector("input[type=checkbox]");
	var editButton = taskListItem.querySelector("button.edit");
	var deleteButton = taskListItem.querySelector("button.delete");

	//bind editTask to edit button
	editButton.onclick = editTask;

	//bind deleteTask to delete button
	deleteButton.onclick = deleteTask;

	//bind checkBoxEventHandler to checkbox
	checkBox.onchange = checkBoxEventHandler;
}

//var ajaxRequest = function() {
//	console.log("AJAX request");
//} 

//Set the click handler to the addTask function
addButton.addEventListener("click", addTask);
//addButton.addEventListener("click", ajaxRequest);

//cycle over incompleteTasksHolder ul list items
for (var i = 0; i < incompleteTasksHolder.children.length; i++) {
	//bind events to list item's children (taskCompleted)
	bindTaskEvents(incompleteTasksHolder.children[i], taskCompleted);
}

//cycle over completedTasksHolder ul list items
for (var i = 0; i < completedTasksHolder.children.length; i++) {
	//bind events to list item's children (taskIncomplete)
	bindTaskEvents(completedTasksHolder.children[i], taskIncomplete);
}

 
//todo 끝
  
</script>    
      
 <div class="container">       
		<h3>추가하기</h3>   
		<p style="margin-top: 10px;">  
			<input id="new-task" type="text"><button class="ok_btn">확인</button>
		</p>  

		<div style="width: 600px;">  
			<h3>할 일</h3>   
			<ul id="incomplete-tasks">
				<li class="todo_li"><input type="checkbox"><label>지출하기</label><input type="text"><input type="text" value=""><button class="delete">삭제</button><button class="edit">수정</button></li>
				<li class="todo_li"><input type="checkbox"><label>요청사항 처리하기</label><input type="text" value=""><button class="delete">삭제</button><button class="edit">수정</button></li>
			</ul>
		</div>
		   
		<div style="width: 600px;position: absolute;top: 228px;right: 153px;">
			<h3>완료</h3>
			<ul id="completed-tasks">
				<li class="todo_li"><input type="checkbox" checked><label>연차올리기</label><input type="text"><button class="delete">삭제</button><button class="edit">수정</button></li>
			</ul>
		</div> 
	</div>      
