describe('Home', () => {
    beforeEach(() => {
        cy.visit('/')
    })

    it('has a link to the departments page', () => {
        cy.contains('Departments').click()
        cy.url().should('include', '/departments')
    })
})
