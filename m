Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B55311E0B
	for <lists+linux-tegra@lfdr.de>; Sat,  6 Feb 2021 15:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbhBFOzr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 6 Feb 2021 09:55:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbhBFOzj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 6 Feb 2021 09:55:39 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DB1C061756
        for <linux-tegra@vger.kernel.org>; Sat,  6 Feb 2021 06:54:59 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id f14so17628747ejc.8
        for <linux-tegra@vger.kernel.org>; Sat, 06 Feb 2021 06:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=MeFFAMytM1pG4T2BQDZK+L1QtpcyH8r4JIW71Uns7nAYlPcjrgAgHT2Cop/lVL6ytq
         3wjaClW4qPujUVkv6M/ms+rRtnJi9rqPrvV6ppAGDPxi5FXyrUkG5vb+De7s9kOVIK2f
         3dYJmY/PRfv8w39Xi33Skd4jWCjFF4j3YOmJm/bKNwFkjQnE/I7KLVdCu0LNhWKsaS3s
         k8DiMK67z4X6kM6sNAnl67A/Xyi1k3YO/2AlMT7AU5eC7CrO+NHtrJGCnlRX9eeeC8j7
         kM2B6b1Yd8ILsgqY/Tjf66QQmEJU6oP0YdbtVFMWDSIcnyI/6AZVODL/rFNXLC1HZ8+e
         42mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=BYWWSGyFp0jQYvwEkqu95wjhkeOetxoKFeWoqUgNq5R8WS8caM+0+j9Vc1aWt2Jdip
         HEguJYVL4Sa/KXfoBxhculXQg8zUJa1lqZaLPgvI4x7GcMtslNhVkymp8xtvTiTvgqmc
         KCcu0vVAMn6OVdazhLDzVxBcD+C1xczNaooyP88qzsjrbU0OzeWFEHaDKl6f97qClfpq
         U12fQ0RE5Zs1nVJtinWivNiYFR4+0S/Eq7f4gQ7BZaWphJkJxxin0jPq/ZB8XW1jLkdK
         Xxy1uhjQDn3xE2vwOhcjOORzwkUPd7A/eWUScZTSta+JyUCWw4CtdUGHmJXiM7g9BaQ1
         8u2g==
X-Gm-Message-State: AOAM5303i70m34AVHFeKHRWHbMXH/k9aSbrakG8keV58J+3bFl5utFYB
        JC3xqS8R0DskC4TUFr8xC+rOX92f1eK21qPQdKs=
X-Google-Smtp-Source: ABdhPJyKhoOaEy1r8BQEbmyk53jaAx7KpWCwbqJ433GRfVWGu+52ZKwJ+BssMCDMIbOS6aQf+Z7Y5WxuHfytUMuBGCk=
X-Received: by 2002:a17:906:442:: with SMTP id e2mr9320467eja.9.1612623298464;
 Sat, 06 Feb 2021 06:54:58 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:54:58
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:54:58 +0100
Message-ID: <CAGSHw-CrfPYW9fuyL0eaS1suwaaFMNx8eOoHdA129x1Eq7EpNw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
