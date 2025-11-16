import React from 'react';
import { useModalStore } from '@/stores/modal-store';
import { Input } from '@/shared/ui/Input/Input';
import { Button } from '@/shared/ui/Button/Button';
import styles from './Modals.module.css';

export const LoginModal: React.FC = () => {
  const { closeAll, openRegister, isLoginOpen } = useModalStore();

  if (!isLoginOpen) {
    return null;
  }

  return (
    <div className={styles.modal} onClick={(e) => e.stopPropagation()}>
      <div className={styles.modalHeader}>
        <h3>Вход в аккаунт</h3>
        <span className={styles.modalClose} onClick={closeAll}>&times;</span>
      </div>

      <Input type="email" placeholder="E-mail" />
      <Input type="password" placeholder="Пароль" />

      <a href="#" className={styles.linkSmall}>Восстановить пароль</a>

      <Button className={styles.w100}>Войти</Button>

      <div className={styles.modalBottom}>
        Нет аккаунта? <a href="#" onClick={openRegister}><b>Зарегистрируйтесь</b></a>
      </div>
    </div>
  );
};