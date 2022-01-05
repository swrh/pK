describe('Departments', () => {
    beforeEach(() => {
        cy.visit('/departments')
    })

    it('has a title', () => {
        cy.title().should('eq', 'pK | Departments')
    })

    it('has a link to the creation form', () => {
        cy.contains('New').click()
        cy.url().should('include', '/departments/new')
    })
})
