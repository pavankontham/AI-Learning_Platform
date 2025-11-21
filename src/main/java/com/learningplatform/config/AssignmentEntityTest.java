package com.learningplatform.config;

import com.learningplatform.model.Assignment;
import com.learningplatform.repository.AssignmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * Test component to verify Assignment entity and repository are working
 */
@Component
public class AssignmentEntityTest implements CommandLineRunner {

    @Autowired(required = false)
    private AssignmentRepository assignmentRepository;

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        System.out.println("[TEST] Testing Assignment entity and repository...");

        if (assignmentRepository == null) {
            System.err.println("[ERROR] AssignmentRepository is NULL - not injected by Spring");
            return;
        }

        System.out.println("[SUCCESS] AssignmentRepository successfully injected");

        try {
            // Test creating an Assignment entity
            Assignment testAssignment = new Assignment();
            testAssignment.setTitle("Test Assignment Entity");
            testAssignment.setDescription("Testing if Assignment entity works");
            testAssignment.setCourseId("test-course");
            testAssignment.setInstructorId("test-instructor");
            testAssignment.setType(Assignment.AssignmentType.CODING);
            testAssignment.setDifficulty(Assignment.Difficulty.EASY);
            testAssignment.setProblemStatement("Test problem statement");
            testAssignment.setPublished(false);
            testAssignment.setCreatedAt(LocalDateTime.now());

            System.out.println("[SUCCESS] Assignment entity created successfully");

            // Test saving the assignment
            Assignment saved = assignmentRepository.save(testAssignment);
            System.out.println("[SUCCESS] Assignment saved successfully with ID: " + saved.getId());

            // Test finding the assignment
            long count = assignmentRepository.count();
            System.out.println("[SUCCESS] Assignment count in database: " + count);

            // Clean up
            assignmentRepository.delete(saved);
            System.out.println("[SUCCESS] Test assignment cleaned up");

            System.out.println("[COMPLETE] Assignment entity and repository are working correctly!");

        } catch (Exception e) {
            System.err.println("[ERROR] Error testing Assignment entity: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
