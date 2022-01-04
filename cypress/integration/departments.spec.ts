describe('Departments Tests', () => {
    it('Verifies that the link to the creation form works', () => {
        cy.visit('/departments')
        cy.contains('New').click()
        cy.url().should('include', '/departments/new')
    });
})
