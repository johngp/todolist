package fr.icdc.dei.todolist.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import fr.icdc.dei.todolist.service.TaskService;

@Controller
@RequestMapping("/tasks")
public class TaskController {
	
	@Autowired
	private TaskService taskService;

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listTasks() {
		ModelAndView page = new ModelAndView("Tasks");
		page.addObject("tasks", taskService.list());
		return page;
	}
	
	@RequestMapping(value="/tasksNotEndedInDateRange",method=RequestMethod.GET)
	public  ModelAndView notEndedInDateRange(@RequestParam("from") String fromStr, @RequestParam("to") String toStr) throws ParseException{
		SimpleDateFormat dateFormater = new SimpleDateFormat ("MM/dd/yyyy");
		ModelAndView page = new ModelAndView("TasksNotEndedInDateRange");
		Date from= dateFormater.parse(fromStr);
		Date to = dateFormater.parse(toStr);
		page.addObject("tasks", taskService.findAllTaskNotEndedWithEndingDateBetweenDates(from, to));
		page.addObject("from", fromStr);
		page.addObject("to", toStr);
		return page;
	}
		
	@RequestMapping(value="/endTasks",method=RequestMethod.GET)
	public RedirectView toggleTaskEnd(@RequestParam("from") String fromStr, @RequestParam("to") String toStr) throws ParseException{
		SimpleDateFormat dateFormater = new SimpleDateFormat ("MM/dd/yyyy");
		Date from= dateFormater.parse(fromStr);
		Date to = dateFormater.parse(toStr);
		taskService.endAllTasksWithEndingDateBetweenDates(from, to);
		return new RedirectView("/todolist-presentation/tasks");
	}
	
	
}