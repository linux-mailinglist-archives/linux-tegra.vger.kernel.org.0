Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24CF413CFF3
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Jan 2020 23:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729142AbgAOWNs (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 15 Jan 2020 17:13:48 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39002 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgAOWNs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Jan 2020 17:13:48 -0500
Received: by mail-wr1-f66.google.com with SMTP id y11so17245489wrt.6
        for <linux-tegra@vger.kernel.org>; Wed, 15 Jan 2020 14:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jjk2lk0coFY9ky3dccWsNYtTIwikSmt9RMYvNCVUp4U=;
        b=LRdX6STMRraiJOK8g+uBaBDE6NnDcAbS8fBNX4ysrYa0wG6haFD1fMgHbT5fFU77nA
         YrXaGseZ7308Fn6ighU7nryVe4dD2k+CR+Uqmccu7TN4/8F1dmguu4QzfE3D2//40R2+
         eahm9gmEFrnB5VdyiuOmwvVhobh+Z3DYbfQb7X675spkr81dldwLozw81cLm4TfkzM5q
         +q3xRsocQLgrNTgUjMjygexJoVImki7YaFhE0b2345eml2RaZUeydQXcrdi0b1RhbpjH
         40D8BPFHAQUziqB+I6q7BSEJ5JHUarHQ8JUZKHjYdkZMTcv9jkAL0oIVJpFvY04AxGbZ
         vjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jjk2lk0coFY9ky3dccWsNYtTIwikSmt9RMYvNCVUp4U=;
        b=CCDfNCPytJdHoCyKo2itLUbx1IqQsGZ4QfknGT8fJ2P2GsU0mrMD4fbotcvB2kMjEZ
         sL7efz33elxgr04WOiLpOas9UNLuAchirwV64/kx0tfCiv9xdqrVUT9PQk0ZFrhSt4JT
         IiY5GBAw/H3VdNX6Cx+7iAkKpmNFA+iyMgI5o1pqIUqIsqx/lwOc4QQvDCVBoYAi94W6
         qnj6cLmDO3c7w8jA1axAkniPXGYwYNm2Rrkr2WyUN1Steezcr6Xfa4LoAmcLZQrIH1Cz
         I9tVnmL8hm3x0IpMbhzgc0vMcNFxLJrtegggfiOkb2GVGofUwlys9jUPR2mb0W7j1AdH
         fXcg==
X-Gm-Message-State: APjAAAUhhJKj2I/sgxSn6GilJX+amM6xSyXLs8tJ9U7WcunIWi5KqVJU
        rSwMsizwyM72L5yiKQDBhvXAVFfcGVvtVKq0YqpUpH31zz0=
X-Google-Smtp-Source: APXvYqzJDarClmBags7NVyps6VN6V/4CjNZMJv14HgoHCdZnB28dZtEvxscpwJxlu6KVtyUoXCqInkvNP4oOTmmCyhM=
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr33441465wrt.254.1579126426574;
 Wed, 15 Jan 2020 14:13:46 -0800 (PST)
MIME-Version: 1.0
References: <20190618180206.4908-1-mmaddireddy@nvidia.com> <20190618180206.4908-8-mmaddireddy@nvidia.com>
In-Reply-To: <20190618180206.4908-8-mmaddireddy@nvidia.com>
From:   Nicolas Chauvet <kwizart@gmail.com>
Date:   Wed, 15 Jan 2020 23:13:34 +0100
Message-ID: <CABr+WTkoj1zk6RRdPvb2wd9HgBJEbPJR=dtY4f+V1gFrEb671A@mail.gmail.com>
Subject: Re: [PATCH V6 07/27] PCI: tegra: Advertise PCIe Advanced Error
 Reporting (AER) capability
To:     Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, vidyas@nvidia.com,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Le mar. 18 juin 2019 =C3=A0 20:02, Manikanta Maddireddy
<mmaddireddy@nvidia.com> a =C3=A9crit :
>
> Default root port setting hides AER capability. This patch enables the
> advertisement of AER capability by root port.

Hello,

For your information, I've reported an issue on kernel.org that is
related to AER in pcie with the ethernet NIC on jetson-tk1
https://bugzilla.kernel.org/show_bug.cgi?id=3D206217

I hope someone can shred some lights on this.

--=20
-

Nicolas (kwizart)
