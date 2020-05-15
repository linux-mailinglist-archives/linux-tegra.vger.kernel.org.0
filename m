Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25FDA1D5289
	for <lists+linux-tegra@lfdr.de>; Fri, 15 May 2020 16:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgEOOxT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 May 2020 10:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOOxT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 May 2020 10:53:19 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3F9C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:19 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f13so2598057wmc.5
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zyKwaYXGBkl0DIgprI1YSMnmA/Vqf8RxsVKmhXfR9rs=;
        b=aaecgStn8EsM/hXUdRJYds+B0RQE50sdvMZef7sIJG5drSd+bsA37FyhGlcx7kCN3o
         SJf4fub56oR+juB8Rc+uMBEQXG9SwS/LM7naq0e4zkrpe7kKWqeP8wxGkNsjIo7oQJM0
         qnbOgzSaL0fIpGVFSsZfS3CdM+W49eGITmB6qI2gE8UlFx4rHqQTo+MNk4K7mujOc68L
         FvSWo87tw6N1w6VIxk6uLULlUi5ZvCthKWWjwvBRFnfkT9gODErrCbw8W07BxZaKk5sh
         zVtRZScI4B0RR7W7lhGRLuCMRzUrCztu9MT1Og7rcOei3BSsugDN5GJwj8VattdG4n0n
         dx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zyKwaYXGBkl0DIgprI1YSMnmA/Vqf8RxsVKmhXfR9rs=;
        b=HR4g+YZNlkrcUuM2oT7i4RswisOk5YQCb89Wz2UbG59kn4H1g/Sz1Ex6FrY7qJ4i8E
         Gs+jyty40QsyvIPDdMLWLTDsiiP4IjWQTU+lBQwb1r8VwQKIWUuHj/HEBE5AXFG/hAHT
         ZzC9y987o5qFe+g0tyyI+GnRa/pqaRSQCGkeF1lUu7/psi9/IsA7T4jVfC1gtYdYLGSU
         wMF+qe/a7sCdZoHDom45Rj61Yt0QYrv8l54hF8ChwFf7+hBezvQON4ZeschjbzGKutap
         zj9Mgg7xyhqakctfwMmNaUV+oV8FzFRFc8R7+8/M7n3vUcgYEUJ/LMrIHVQx4ycx0iPp
         s8Yw==
X-Gm-Message-State: AOAM532cTo6oWM0ge+ielHrnRTXFDyqD/vTzMc3JonEgxpBE2v6QiQb/
        GkHaIM5KrLW0iAuNJlUtzCtxz3ql
X-Google-Smtp-Source: ABdhPJySgo1wYUn7D8Qoq++bBK2duPUbF4YrulvM455Jdzh3kpydW3gtiiEqNhF4U3tWW6K6yXHHSQ==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr4422601wmc.88.1589554397994;
        Fri, 15 May 2020 07:53:17 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id 5sm3865649wmz.16.2020.05.15.07.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:53:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 01/11] cpufreq: Changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:53:01 +0200
Message-Id: <20200515145311.1580134-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200515145311.1580134-1-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-cpufreq

for you to fetch changes up to 9ce274630495c731257fb1b569dd7b84a2fdba14:

  cpufreq: tegra20: Use generic cpufreq-dt driver (Tegra30 supported now) (2020-05-06 18:59:38 +0200)

Thanks,
Thierry

----------------------------------------------------------------
cpufreq: Changes for v5.8-rc1

This change move Tegra20 and Tegra30 to the generic DT CPU frequency
scaling driver.

----------------------------------------------------------------
Dmitry Osipenko (1):
      cpufreq: tegra20: Use generic cpufreq-dt driver (Tegra30 supported now)

 drivers/cpufreq/Kconfig.arm       |   6 +-
 drivers/cpufreq/tegra20-cpufreq.c | 217 ++++++++++----------------------------
 2 files changed, 59 insertions(+), 164 deletions(-)
