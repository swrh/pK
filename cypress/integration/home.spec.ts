describe('Home Tests', () => {
    it('Verifies that the link to the departments page works', () => {
        cy.visit('/')
        cy.contains('Departments').click()
        cy.url().should('include', '/departments')
    })
})
