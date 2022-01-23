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
        return list().then((first: any) => {
            expect(first).to.be.an('array')
            expect(first.length).to.not.be.lessThan(0)
            const firstDepartment: WithId<Department>[] = first
            return create({ name }).then((created: any) => {
                expect(created).to.have.property('name', name)
                expect(created).to.have.property('_id').to.be.a('string')
                const createdDepartment: WithId<Department> = created
                expect(firstDepartment.reduce((n, e) => n + (e._id == createdDepartment._id ? 1 : 0), 0)).to.be.eq(0)
                return list().then((second: any) => {
                    expect(second).to.be.an('array')
                    expect(second.length).to.be.eq(firstDepartment.length + 1)
                    const secondDepartment: WithId<Department>[] = second
                    expect(secondDepartment.reduce((n, e) => n + (e._id == createdDepartment._id ? 1 : 0), 0)).to.be.eq(1)
                    return del(createdDepartment._id).then((deleted) => {
                        return list().then((third: any) => {
                            expect(third).to.be.an('array')
                            expect(third.length).to.be.eq(firstDepartment.length)
                            const thirdDepartment: WithId<Department>[] = third
                            expect(thirdDepartment.reduce((n, e) => n + (e._id == createdDepartment._id ? 1 : 0), 0)).to.be.eq(0)
                        })
                    })
                })
            })
        })
    })
})
