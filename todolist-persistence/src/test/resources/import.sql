-- CategoryDaoTest
-- testFindCategory
-- ID = 1L
INSERT INTO category(name) VALUES('testFindCategoryNameDB');
-- testUpdateCategoryHasNameChanged
-- ID = 2L
INSERT INTO category(name) VALUES('testUpdateCategoryChangedNameDB');
-- testUpdateCategoryHasRightName
-- ID = 3L
INSERT INTO category(name) VALUES('testUpdateCategoryRightNameDB');

-- TaskDaoTest
-- testFindableByLabel
-- ID_TASK = 1L
INSERT INTO task(label,  id_user, id_category, endingDate, isEnded) VALUES('testFindableLabelDB', 1, 3, '2016-10-08', false);
-- testListTasksForGivenUserAndCategory
-- ID_USER = 1L
INSERT INTO user(name, USER_TYPE) VALUES('testUserDB', 'USER_FREE');
-- ID_CATEGORY = 4L
INSERT INTO category(name) VALUES('testCategoryDB');
-- ID_TASK = 2L
INSERT INTO task(label, id_user, id_category, endingDate, isEnded) VALUES('testListByUserAndCategoryDB', 1, 4, '2016-09-08', false);