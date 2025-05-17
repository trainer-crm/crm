import React from 'react';
import type { Meta, StoryObj } from '@storybook/react';
import Test from './test';  

const meta: Meta<typeof Test> = {
  title: 'Components/Hello',
  component: Test,
  tags: ['autodocs'],
};

export default meta;
type Story = StoryObj<typeof meta>;

export const Default: Story = {};