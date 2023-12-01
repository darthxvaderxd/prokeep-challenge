import { Controller, Get, Query } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('/')
  newMessageForQueue(
    @Query('queue') queue: string,
    @Query('message') message: string,
  ): string {
    const result = this.appService.addMessageForQueue(queue, message);

    if (result) {
      return 'Message added to queue';
    }

    throw new Error('Message not added to queue');
  }
}
