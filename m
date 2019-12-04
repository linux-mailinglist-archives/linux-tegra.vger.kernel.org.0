Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26FDC112C4C
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Dec 2019 14:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbfLDNIC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Dec 2019 08:08:02 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33378 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfLDNIC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Dec 2019 08:08:02 -0500
Received: by mail-wr1-f68.google.com with SMTP id b6so8584693wrq.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Dec 2019 05:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/7IM0fv40hADv5GE+ySNRZnxruCXkFYwzWNw9KugEzc=;
        b=got+vM/4BLEJka9KYKG+DGIsI8XOzl2yBzrtfBCGzw7DRektRkAeHZ1SPa/bo4z5Gx
         raFW4UYxTzvqz/svRpp+8QGW1I4uYlQdMYxbnTpszg7y0IywHPi6LUaF/Tw8e3snAxIV
         fX4xlq8FwN0tTikt4LW8yIWzBMt36MrqGCS19avhSQm8Qy7tD8+dg0SYekK40ju9EAuy
         kfg+ji/CjJA9Ik8OjQ27GG/NB0nWbA66Dja06Es6rjT+466Jrc1vJqFi69LKjyImAhZc
         sEFFNnrWEahjSuxO+oen/aGcE5SPTEUYmol2tFGMZ2B+6lGzwg3hX7fYbpS1bK0MbRAN
         X8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/7IM0fv40hADv5GE+ySNRZnxruCXkFYwzWNw9KugEzc=;
        b=KM5XPmNBYU0ky+ZYvYAHmId/h81tVWiWYX9u+c3Purf60Ot0T5+GoJTcWPDp7qElMx
         f3fAgxZE9ydte8xi0sO0N5bUV9t8gctsgWY6a3Ph3QM1bct5MHS2FF1FbQ2pC6wJXonF
         BRJVKmeZ3ilpRN8H1NxQfQI49f1M4xjyYGF44GJzESFd4hYSt2weAqEOQ/Sm5Dh3PgjF
         KvAL1VOVDKsymbc63YI1EjpcwVrlouoEOkO4P47An/OEXiV4qyzf9qZ0ZwDGXq5k1IdB
         LEwLMB6tl3emOiD9Xdk8HcG7feRDuVx+Jlw3a/F2c4EwYCm238jU/BVndXw4Y+bkPavA
         Ac1A==
X-Gm-Message-State: APjAAAUAp0dUWupfUlFrFeNDTCELKBl6jK4nngD2IXI0vQTLyxBtoi5i
        iOpwVB8M/iiXhp4r5MnsW/8=
X-Google-Smtp-Source: APXvYqx+JJ7wzKgp89nig0jYQ/8cLqpqZ6rH+Nv69b2Ijv114+lAuxQoETrAKA7GgMu0DqC17nE7xw==
X-Received: by 2002:a5d:480b:: with SMTP id l11mr4057766wrq.129.1575464880292;
        Wed, 04 Dec 2019 05:08:00 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id k8sm8181241wrl.3.2019.12.04.05.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 05:07:59 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     soc@kernel.org, arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/3] cpufreq: tegra: Fixes for v5.5-rc1
Date:   Wed,  4 Dec 2019 14:07:53 +0100
Message-Id: <20191204130753.3614278-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204130753.3614278-1-thierry.reding@gmail.com>
References: <20191204130753.3614278-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-cpufreq

for you to fetch changes up to 0fb438eed10ca13d212a5675363beb5a5cd721f2:

  cpufreq: tegra124: Add suspend and resume support (2019-10-29 13:25:29 +0100)

I had originally meant for this to go in through the cpufreq tree, but
I might have messed up the messaging, so Viresh ended up not pulling it
into his tree. He did provide an Acked-by, which I've included in the
patch, so he probably was assuming this to go via some other tree all
along.

Unfortunately, it's now causing suspend/resume to fail because the clock
driver changes require the CPU frequency driver to disable the CPU clock
before suspend can be entered, so it'd be great to get this in via late
fixes for ARM SoC.

Thanks,
Thierry

----------------------------------------------------------------
cpufreq: tegra: Changes for v5.5-rc1

Implements support for suspend/resume on Tegra124.

----------------------------------------------------------------
Sowjanya Komatineni (1):
      cpufreq: tegra124: Add suspend and resume support

 drivers/cpufreq/tegra124-cpufreq.c | 59 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
