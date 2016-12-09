package fr.icdc.dei.todolist.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fr.icdc.dei.todolist.persistence.dao.TaskDao;
import fr.icdc.dei.todolist.persistence.entity.Task;
import fr.icdc.dei.todolist.service.TaskService;

@Service("TaskService")
public class TaskServiceImpl implements TaskService {
	
	@Autowired
	private TaskDao taskDao;

	@Override
	public List<Task> list() {
		return taskDao.findAll();
	}

	@Override
	public Task add(Task task) {
		if(task.getUser().getTasks().size() < 10)
			return taskDao.save(task);
		return null;
	}

	@Override
	public List<Task> findAllTaskWithEndingDateBetweenDates(Date begindaterange, Date enddaterange) {
		return taskDao.findAllByEndingDateBetween(begindaterange, enddaterange);				
	}

	@Override
	public List<Task> findAllTaskNotEndedWithEndingDateBetweenDates(Date begindaterange, Date enddaterange) {
		return taskDao.findAllByIsEndedFalseAndEndingDateBetween(begindaterange, enddaterange);
	}
	
	@Override
	public boolean endTask(Task task) {
		task.setIsEnded(true);
		return taskDao.save(task).getIsEnded();
	}
	
	@Override
	public boolean endTasks(List<Task> tasks) {
		boolean tasksAreSetEnded= true;
		for(Task task: tasks){
			if(!endTask(task))
				tasksAreSetEnded=false;
		}
		return tasksAreSetEnded;
	}

	@Override
	public boolean endAllTasksWithEndingDateBetweenDates(Date begindaterange, Date enddaterange) {
		return endTasks(taskDao.findAllByIsEndedFalseAndEndingDateBetween(begindaterange, enddaterange));
	}
}
