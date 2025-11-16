import React from 'react';
import { useModalStore } from '@/stores/modal-store';
import { Input } from '@/shared/ui/Input/Input';
import { Button } from '@/shared/ui/Button/Button';
import styles from './Modals.module.css';

export const RegisterModal: React.FC = () => {
  const { closeAll, openLogin, isRegisterOpen } = useModalStore();

  if (!isRegisterOpen) {
    return null;
  }

  return (
    <div className={`${styles.modal} ${styles.active}`}>
      <div className={styles.modalHeader}>
        <h3>Регистрация</h3>
        <span className={styles.modalClose} onClick={closeAll}>&times;</span>
      </div>

      <Input type="text" placeholder="Имя" />
      <Input type="text" placeholder="Фамилия" />
      <Input type="email" placeholder="E-mail" />
      <Input type="password" placeholder="Пароль" />

      <label className={styles.checkboxRow}>
        <input type="checkbox" />
        <span>Я согласен(-а) с предоставлением и обработкой своих персональных данных</span>
      </label>

      <Button className={styles.w100}>Зарегистрироваться</Button>

      <div className={styles.modalBottom}>
        Уже есть аккаунт? <a href="#" onClick={openLogin}><b>Войдите</b></a>
      </div>
    </div>
  );
};