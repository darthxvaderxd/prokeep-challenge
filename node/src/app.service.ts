import { Injectable } from '@nestjs/common';
import { addMessageForQueue } from './message-queue';

@Injectable()
export class AppService {
  addMessageForQueue(queue: string, message: string): boolean {
    try {
      addMessageForQueue({ queue, message });
      return true;
    } catch (error) {
      console.error(error);
    }

    return false;
  }
}
