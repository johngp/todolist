package fr.icdc.dei.todolist.service;

import java.util.Date;
import java.util.List;

import fr.icdc.dei.todolist.persistence.entity.Task;

public interface TaskService {

	List<Task> list();

	Task add(Task task);

	List<Task>  findAllTaskWithEndingDateBetweenDates(Date begindaterange, Date enddaterange);

	List<Task>  findAllTaskNotEndedWithEndingDateBetweenDates(Date begindaterange, Date enddaterange);

	boolean endTask(Task task);
	
	boolean endTasks(List<Task> tasks);

	boolean endAllTasksWithEndingDateBetweenDates(Date begindaterange, Date enddaterange);
	
}