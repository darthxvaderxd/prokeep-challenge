import {
  Controller,
  Get,
  Query,
  Res,
} from '@nestjs/common';
import { Response } from 'express';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('/')
  newMessageForQueue(
    @Query('queue') queue: string,
    @Query('message') message: string,
    @Res() response: Response,
  ): Response {
    if (!queue) {
      return response.status(400)
        .send('No queue specified');
    }

    if (!message) {
      return response.status(400)
        .send('No message specified');
    }

    const result = this.appService.addMessageForQueue(queue, message);

    if (result) {
      return response.status(200)
        .send('Message added to queue');
    }

    return response.status(500)
        .send('Message not added to queue, due to an unknown error');
  }
}
