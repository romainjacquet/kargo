
var aws = require('aws-sdk');

const s3 = new aws.S3({
  accessKeyId: process.env.S3_ACCESS_KEY,
  secretAccessKey: process.env.S3_SECRET_ACCESS_KEY
})

module.exports = {
  version: '1.0.0',
  init: function (pluginContext) {
    pluginContext.registerAdminRoute((app) => {
      app.get(pluginContext.settings.endpointName + '/:bucket/*', (req, res) => {
        s3.getObject({
          Bucket: req.params.bucket,
          Key: req.params[0]
        })
        .createReadStream()
        .on('error', (err) => {
          return res.status(404).send(err);
        })
        .pipe(res)
      });
    });
  },
  schema: {
    $id: 'http://express-gateway.io/plugins/s3.json',
    type: 'object',
    properties: {
      endpointName: {
        type: 'string',
        default: '/s3'
      }
    }, 
    required: ['endpointName']
  }
};