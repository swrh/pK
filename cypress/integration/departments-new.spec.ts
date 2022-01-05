describe('New Department', () => {
    beforeEach(() => {
        cy.visit('/departments/new')
    })

    it('has a title', () => {
        cy.title().should('eq', 'pK | New Department')
    })

    it('has a back button', () => {
        cy.contains('Back').click()
        cy.url().should('include', '/departments')
        cy.url().should('not.include', '/departments/new')
    })
})
