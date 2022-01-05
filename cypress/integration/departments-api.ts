import { Chance } from 'chance'
import { ObjectId, WithId } from 'mongodb'

import { createDepartment, deleteDepartment, Department, listDepartments } from '../../lib/pK'

const chance = Chance()

describe('Departments API', () => {
    it('creates, lists and deletes entities', () => {
        // This code is really ugly, but... there isn't much I can do at the moment. Hopefully I'll improve it in the near future.
        const list = () => {
            return new Cypress.Promise((resolve, reject) => listDepartments()
                .then(resolve)
                .catch(reject)
            )
        }
        const create = (department: Department) => {
            return new Cypress.Promise((resolve, reject) => createDepartment(department)
                .then(resolve)
                .catch(reject)
            )
        }
        const del = (id: ObjectId) => {
            return new Cypress.Promise((resolve, reject) => deleteDepartment(id)
                .then(resolve)
                .catch(reject)
            )
        }

        const name = chance.name()

        // Horrible horizontal code. Please, fix it up.
        return list().then((first: WithId<Department>[]) => {
            expect(first).to.be.an('array')
            expect(first.length).to.not.be.lessThan(0)
            return create({ name }).then((created: WithId<Department>) => {
                expect(created).to.have.property('name', name)
                expect(created).to.have.property('_id').to.be.a('string')
                expect(first.reduce((n, e) => n + (e._id == created._id ? 1 : 0), 0)).to.be.eq(0)
                return list().then((second: WithId<Department>[]) => {
                    expect(second).to.be.an('array')
                    expect(second.length).to.be.eq(first.length + 1)
                    expect(second.reduce((n, e) => n + (e._id == created._id ? 1 : 0), 0)).to.be.eq(1)
                    return del(created._id).then((deleted) => {
                        return list().then((third: WithId<Department>[]) => {
                            expect(third).to.be.an('array')
                            expect(third.length).to.be.eq(first.length)
                            expect(third.reduce((n, e) => n + (e._id == created._id ? 1 : 0), 0)).to.be.eq(0)
                        })
                    })
                })
            })
        })
    })
})
