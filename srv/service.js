
const { User } = require('@sap/cds');
const cds = require('@sap/cds');

class servicesdesk_srv extends cds.ApplicationService {

  async init() {
    this.before("UPDATE", "solicitudesUser", (req) => this.onUpdate(req));
    this.before("UPDATE", "solicitudesAdmin", (req) => this.onUpdateAdmin(req));
    this.before("CREATE", "solicitudesUser", (req) => this.onCreate(req));

    return super.init();
  }

  // Reabrir solicitud USER
  async onUpdate(req) {
    const data = await req.data
    const user = await req.user
    if (user.roles?.User) {
      const { Estado_code } = await SELECT.one(req.subject, i => i.Estado_code).where({ ID: req.data.ID })
      if (Estado_code === 'CERRADA') {
        const existingData = await SELECT.one(req.subject).where({ ID: req.data.ID });
        if (data.motivo !== existingData.motivo) {
          return req.reject(`No se puede modificar esta solicitud`)
        }
        if (data.tipo_solicitud !== existingData.tipo_solicitud) {
          return req.reject(`No se puede modificar esta solicitud`)
        }
        if (data.Urgencia_code !== existingData.Urgencia_code) {
          return req.reject(`No se puede modificar esta solicitud`)
        }
      }
    }
  }

  //Nuevo registro no deja modificar el ESTADO y URGENCIA, solo 
  async onCreate (req) {
    const dataCreate = await req.data
    const userCreate = await req.user
    if(userCreate.roles?.User){
      if (dataCreate.Estado_code !== 'PENDIENTE') {
        req.reject (`No se puede modificar el estado y urgencia por defecto`)
      }
      if (dataCreate.Urgencia_code !== 'MEDIA') {
        req.reject (`No se puede modificar el estado y urgencia por defecto`)
      }
    }
  }

  // ADMIN no puede modificar una solicitud 'CERRADA'
  async onUpdateAdmin (req) {
    const dataAdmin = await req
      if(dataAdmin.user.roles?.Admin) {
        const { Estado_code } = await SELECT.one(req.subject, i => i.Estado_code).where({ID: req.data.ID})
        if (Estado_code === 'CERRADA')
        return req.reject(`No se puede modificar, esta solicitud está cerrada`)
      }
  }
}
module.exports = { servicesdesk_srv }
