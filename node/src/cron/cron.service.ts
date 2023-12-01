import { Injectable } from '@nestjs/common';
import { Cron } from '@nestjs/schedule';
import { processSingleMessageFromAllQueues } from '../message-queue';

@Injectable()
export class CronService {
  // run every second to process message from queues
  @Cron('* * * * * *')
  processQueues() {
    processSingleMessageFromAllQueues();
  }
}
