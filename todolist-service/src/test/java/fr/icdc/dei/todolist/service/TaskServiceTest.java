package fr.icdc.dei.todolist.service;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import fr.icdc.dei.todolist.persistence.entity.Task;
import fr.icdc.dei.todolist.persistence.entity.User;
import fr.icdc.dei.todolist.persistence.entity.UserFree;

public class TaskServiceTest extends AbstractServiceTest {
	
	private static final String TASK_LABEL = "taskLabel";
	private static List<Task> tasks;
	private final static Task task = new Task();
	private final static Task task1 = new Task();
	private final static Task task2 = new Task();
	private final static User user = new UserFree();
	private static final Date beginDateRange = new Date(2013,10,11);
	private static final Date endDateRange = new Date(2019,10,11);


	@Autowired
	private TaskService taskService;
		
	@BeforeClass
	public static void setUp() {
		task.setLabel(TASK_LABEL);
		user.setId(2L);
		task.setUser(user);
		task1.setId(3L);
		task1.setId(4L);
		tasks.add(task1);
		tasks.add(task2);
	}

	@Test
	public void testListTasks() {
		assertTrue(CollectionUtils.isNotEmpty(taskService.list()));
	}
	
	@Test
	public void testAddTaskSucceedWithLessThanTenTasksForFreeUser() {
		assertNotNull(taskService.add(task));
	}
	@Test
	public void testListAllTasksWhichHaveEndingDateBetweenDates() {
		assertTrue(CollectionUtils.isNotEmpty(taskService.findAllTaskWithEndingDateBetweenDates(beginDateRange,endDateRange)));
	}
	
	@Test
	public void testListAllTasksNotEndedAndHaveEndingDateBetweenDates() {
		assertTrue(CollectionUtils.isNotEmpty(taskService.findAllTaskNotEndedWithEndingDateBetweenDates(beginDateRange,endDateRange)));
	}
	
	@Test
	public void testCanEndATask(){
		assertEquals(true, taskService.endTask(task));
	}
	
	@Test
	public void testCanEndTasks(){
		assertEquals(true, taskService.endTasks(tasks));
	}
	
	@Test
	public void testCanEndTasksWhichHaveEndingDateBetweenDates(){
		assertEquals(true, taskService.endAllTasksWithEndingDateBetweenDates(beginDateRange, endDateRange));
	}
}
