package fr.icdc.dei.todolist.persistence.dao;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import java.util.Date;
import org.apache.commons.collections.CollectionUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import fr.icdc.dei.todolist.persistence.entity.Task;

public class TaskDaoTest extends AbstractDaoTest {

	private static final long FOURTH_CATEGORY_DB = 4L;
	private static final long FIRST_USER_DB = 1L;
	private static final String TEST_FINDABLE_LABEL_DB = "testFindableLabelDB";
	private static final Date beginDateRange = new Date(2013,10,11);
	private static final Date endDateRange = new Date(2019,10,11);

	@Autowired
	private TaskDao taskDao;
	
	private final static Task task = new Task();
	public final static boolean isEndedValueFalse = false;

	@Test
	public void testCreateTask() {
		task.setLabel("");
		assertNotNull(taskDao.save(task));
	}
	
	@Test
	public void testTaskIsFindableByLabel() {
		assertNotNull(taskDao.findByLabel(TEST_FINDABLE_LABEL_DB));
	}
	
	@Test
	public void testListTasksForGivenUserAndCategory() {
		assertTrue(CollectionUtils.isNotEmpty(taskDao.findAllByUserIdAndCategoryId(FIRST_USER_DB, FOURTH_CATEGORY_DB)));
	}
	
	@Test
	public void testListTasksHaveEndingDateBetweenDates(){
		assertTrue(CollectionUtils.isNotEmpty(taskDao.findAllByEndingDateBetween(beginDateRange,endDateRange)));
	}
	
	@Test
	public void testListTasksNotEndedAndHaveEndingDateBetweenDates(){
		assertTrue(CollectionUtils.isNotEmpty(taskDao.findAllByIsEndedFalseAndEndingDateBetween(beginDateRange,endDateRange)));
	}
	
}
