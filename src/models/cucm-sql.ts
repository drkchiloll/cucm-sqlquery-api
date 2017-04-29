import * as mongoose from 'mongoose';

let { Schema } = mongoose;

export interface IQuery extends mongoose.Document {
  _id:string;
  name:string;
  description?:string;
  query:string;
  type:string;
}

let CucmSqlQuerySchema = new Schema({
  _id:String,
  name: {
    type:String,
    required:true
  },
  description:String,
  query:String,
  type:String
});

CucmSqlQuerySchema.virtual('id').get(function() {
  return this._id;
});
CucmSqlQuerySchema.virtual('id').set(function(id:String) {
  this._id = id;
});
CucmSqlQuerySchema.set('toJSON', {virtuals: true});

export const CucmSqlQuery = mongoose.model<IQuery>(
  'CucmSqlQuery',
  CucmSqlQuerySchema,
  'cucmSqlQueryApi'
);
