import { render } from '@testing-library/react';
import Home from './page';

const setup = () => render(<Home />);

describe('Teste', () => {
  it('Testando', () => {
    const { getByTestId } = setup();
    getByTestId('test');
  });
});
