Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 382D418ADBB
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2020 08:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgCSHzw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Mar 2020 03:55:52 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35023 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgCSHzv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Mar 2020 03:55:51 -0400
Received: by mail-wr1-f66.google.com with SMTP id h4so1474630wru.2;
        Thu, 19 Mar 2020 00:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=50B8ToFEb091pQk7aicdBP2O68dTylRearm13Qtcc7I=;
        b=dk3dx/igcFkHzexE7Skq1Qg+2mVcnbQqB5kCptTWA8zKXDaN20uoC6cD82l6FnmPoO
         au5AFn1yUrKoR3noEs11OSXPRmdyqK5DhUs7auVnpFCC4a6jARKA0JlgdceBYobNmaoA
         9O2jJ0RT88X5Tfxq8og5ycIxjtDE/MjDzQ6lsiZ4wJFnPKQhu5OW6ykRfG+Ng1wlMuNw
         nS+8lffiGD5KqmYQ1tDz4RQNaR8b+KEX2JxGhbFLK6wo38YcBDOQ8vm2nh3FBFvgyYIe
         T9tLyLBzlg7b8VmVXDqzm/hZkTwy7oviDQpjXhryaPRBvZ0znYszqcykS15xx/dfxrqK
         Am9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=50B8ToFEb091pQk7aicdBP2O68dTylRearm13Qtcc7I=;
        b=KRWG3PgBBMszbhBOrZLZtYERsdI8MsKl0k2ha57npaBsSyYpyXViM1JAZD08cxsHCY
         qdBb6fOE/kthzob3keckDwNAfRlBzmpy1k3uL0qhO3L6vZ//Sb898gvl2wiocNwA4YcQ
         mYGuCJSTgba0y/4+WtJf5pv2AzsYlcbverPiErXboosDBgeUIwoQh0Kq7Ej14+elkIkB
         AA0ekN7ERlhgGhuf94U/jwplyQHYYwKblcg3ym5z11wkUfGr+UAE1nlHCsri56/QkO2G
         XfaJOmYRaZlXlYsWrMsyRj/aQhEb9r5NFimCAc/B0M5xuZGYph36Dd7Hr5R8Sv0+SHTG
         QiYA==
X-Gm-Message-State: ANhLgQ17JTCqdvr8wl0Be+ZLyIWrdaw3L63oTLu2U0G1oYN6BaJ9aQfo
        RUCRWDWVejPOw1GS+HW+wsSv4dxR6PGAYY7u6RO2vriUcmE=
X-Google-Smtp-Source: ADFU+vuLyEsrWGTuy6ELaT8rwy9OFIF6XmQMgrXp3S+8NbYSUaamPbqymurVpBUvax5x20WWdFC3t0NGRP/sHuByPNM=
X-Received: by 2002:adf:ea88:: with SMTP id s8mr2615303wrm.124.1584604549252;
 Thu, 19 Mar 2020 00:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200319074401.GA4116@Red>
In-Reply-To: <20200319074401.GA4116@Red>
From:   Nicolas Chauvet <kwizart@gmail.com>
Date:   Thu, 19 Mar 2020 08:55:38 +0100
Message-ID: <CABr+WTnBmJsDZPjUxYkG98dTneDD1p8G=uRftVduTGYbY0ruqQ@mail.gmail.com>
Subject: Re: tegra124-jetson-tk1: sata doesnt work since 5.2
To:     LABBE Corentin <clabbe@baylibre.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        pdeschrijver@nvidia.com,
        Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        axboe@kernel.dk, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-ide@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Le jeu. 19 mars 2020 =C3=A0 08:44, LABBE Corentin <clabbe@baylibre.com> a =
=C3=A9crit :
>
> Hello
>
> sata doesnt work on tegra124-jetson-tk1 on next and master and at least s=
ince 5.2 (but 5.1 works).
> [    0.492810] +5V_SATA: supplied by +5V_SYS
> [    0.493230] +12V_SATA: supplied by +VDD_MUX
> [    2.088675] tegra-ahci 70027000.sata: 70027000.sata supply ahci not fo=
und, using dummy regulator
> [    2.097643] tegra-ahci 70027000.sata: 70027000.sata supply phy not fou=
nd, using dummy regulator
> [    3.314776] tegra-ahci 70027000.sata: 70027000.sata supply ahci not fo=
und, using dummy regulator
> [    3.323658] tegra-ahci 70027000.sata: 70027000.sata supply phy not fou=
nd, using dummy regulator
> [    5.236964] tegra-ahci 70027000.sata: 70027000.sata supply ahci not fo=
und, using dummy regulator
> [    5.245867] tegra-ahci 70027000.sata: 70027000.sata supply phy not fou=
nd, using dummy regulator
> [    5.254706] tegra-ahci 70027000.sata: 70027000.sata supply target not =
found, using dummy regulator
> [    5.310270] phy phy-sata.6: phy poweron failed --> -110
> [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI controll=
er: -110
> [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -110
> [   35.694269] +5V_SATA: disabling
> [   35.697438] +12V_SATA: disabling

It looks strange, because (on same device) , I have sata working as
appropriate, but ethernet fails with me.
https://bugzilla.kernel.org/show_bug.cgi?id=3D206217

It might worth to have another report.

--=20
-

Nicolas (kwizart)
