Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30E25137AA8
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Jan 2020 01:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbgAKAgI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 19:36:08 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40475 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727647AbgAKAgI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 19:36:08 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so3787743wmi.5
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 16:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WETybkijExRZ9cXHgAEpL/eOLOzuJWTx923TC6RLzm8=;
        b=sUPp3LJ0WPvTTqt06OBr20FilZQyjipZ4wSiwxUbN6wmpjVPm/60aoyXN5hbzTRpr4
         /r0379qup+75x2m5bzzaHwcDibCcjqoxHwoEXElcUUEb5I6pdzRRXEpSypnlOk2EPCei
         4iA7bfgj8Akxkyg+nOWLjDCwCiPaY0Ubq29kC8zdCV9l6MQ6YSarlUC4kHLZErk7YKUP
         0H0jP4szdj7gZSA9WZoAfwiZxxJFtjrqErtt9dx2kRNqGn9kpTwVaXhud3wcBi3zb3et
         TNelVlVyCTCEqjsA0v6eNqKX5QI9lbkW+Yrb/rs18lmhSFUj41Mz8+OnyxiYuvlEjwUZ
         oocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WETybkijExRZ9cXHgAEpL/eOLOzuJWTx923TC6RLzm8=;
        b=FzUyqYHZc2SQlfQzufzfSpp0z5WjOaT9IiioT19ot0lYA2vfm7PAfscUI1sWVKFqJo
         iCWGh3cJau51IL/KRFHMEFcWTkb048yYkE1+IAGsQbNBiv+g1Gc1qb2XWApH+ywiQXeM
         UgyZNHENX1vHjkRvs8xjJe6QMaSlimdGiTGKFN1eLWCsslO2EDxe6lKd0PNLUWIc44AG
         cCeo2iSctB8qJdI/UtSB1VqPaYo4wjH5uK24Y9lNzDa3Fr/bwktjE8fQWtsHn6MYqrAi
         Ta1JW8Z6Et/H9N7CfQHDBBHn+3akJ8bAckvMP+dGF0xP+pIgY+OW93I/f6CkasAsPsAl
         B+tw==
X-Gm-Message-State: APjAAAX9e4rOnzirdv3rp4aSY7BSMB1V37yQbZ9hmwbqUm4qrsF+1Sau
        rJo/0zi4/9W6to8RmNnhPII=
X-Google-Smtp-Source: APXvYqyGXPfvL6mqqW2Y/5chjVHeZAZLm3I0XGdY8VpnAe+o7a3qy6z5uPpDG5zvoFN6E/apQBMa1Q==
X-Received: by 2002:a1c:7d93:: with SMTP id y141mr7145622wmc.111.1578702966905;
        Fri, 10 Jan 2020 16:36:06 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id p18sm4143041wmg.4.2020.01.10.16.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:36:05 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/8] ARM: tegra: Device tree changes for v5.6-rc1
Date:   Sat, 11 Jan 2020 01:35:51 +0100
Message-Id: <20200111003553.2411874-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111003553.2411874-1-thierry.reding@gmail.com>
References: <20200111003553.2411874-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-arm-dt

for you to fetch changes up to 834f1d6cf3647e804e7a80569e42ee7fbee50eb1:

  ARM: dts: tegra20: paz00: Add memory timings (2020-01-10 15:41:54 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.6-rc1

This adds memory timings for the PAZ100 and does some minor cleanup for
the external memory controller device tree node on Tegra124.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: dts: tegra20: paz00: Add memory timings

Thierry Reding (2):
      ARM: tegra: Let the EMC hardware use the EMC clock
      ARM: tegra: Rename EMC on Tegra124

 arch/arm/boot/dts/tegra124-apalis-emc.dtsi     |  2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |  2 +-
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi   |  2 +-
 arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  2 +-
 arch/arm/boot/dts/tegra124.dtsi                |  4 ++-
 arch/arm/boot/dts/tegra20-paz00.dts            | 46 ++++++++++++++++++++++++++
 6 files changed, 53 insertions(+), 5 deletions(-)
