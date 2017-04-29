import { Request, Response } from 'express';
import * as Promise from 'bluebird';
import {
  properties,
  logger
} from '../services';

export const controller = (() => {
  let cntrler: any = {};
  cntrler.generic = function(req:Request, res:Response) {
    res.status(201).send('Generic Route Works');
  };
  return cntrler;
})();
