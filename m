Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABB0C1221
	for <lists+linux-tegra@lfdr.de>; Sat, 28 Sep 2019 22:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbfI1UaT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 28 Sep 2019 16:30:19 -0400
Received: from mail-qk1-f178.google.com ([209.85.222.178]:34471 "EHLO
        mail-qk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728569AbfI1UaT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 28 Sep 2019 16:30:19 -0400
Received: by mail-qk1-f178.google.com with SMTP id q203so4710711qke.1
        for <linux-tegra@vger.kernel.org>; Sat, 28 Sep 2019 13:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=+UunCZ+LYdiZ3q7E8sOlACNe8q8P7bG9fnC0LTQ3W+0=;
        b=Pa3EEhpw39CROBlrEMz0vdYEQ1gLMWL5kDq5bfxHnx6dpS6D6DHiks2SxKKJbmqlZA
         mN1jNY0dnCueZvbIe7n+DUCsDhmKWQhbP/06OuRp4EztKu0wwYs4kLJeAIvrSCPXdNJB
         qluKPFQ2jpsBRP3Ia+nForB9xAPsBtfPbhEn1J10dAC+A/9BcvQdEI5LLIx1RL5j4CyM
         wcG+r8cZoUp3IXY8UeoU0lGD3tsVjBaE7sG6HjJgmJtuiGrN1IkuF9JMw9+RUkTDp1eW
         av4lU/DTO6M6EttetfA/+570KfOD3CPz9IoWx1ZcFDwroifr5UNwm0ubf/sLl9/zvi04
         w9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=+UunCZ+LYdiZ3q7E8sOlACNe8q8P7bG9fnC0LTQ3W+0=;
        b=ZjOSTgQa9Q9rEwFYf2H9n4zzTWm2QPqNHOy/i42Lam3WWXewuuJ55OKCG+vG2Idik7
         fQHSwVKyKtqdvusyq7SSWnHtV+PKKJZgeN8hR3CVCEO/uwojbqKUnJm5WANTluzEdv8l
         TWj7v5k5xcTVuxoyCdGipiXg4gpaWt08CXZn2s09Deyo7f7QyCCyA5rsgQsqrkYKN7mw
         vqMmr6NN3ZLUP88GgGCl3JjrG2apILT8MOnXuNFYgAPclVGqPt4UkwvF4PXN24A1tlRK
         ccibLf8mOqqb8ZWuU8yQqkvhWe097ZdPNjxJdYAB/LowkVt0mu+jEgV2YeCKnMGZpdfO
         lieg==
X-Gm-Message-State: APjAAAVSlh0YsL9wzVEj+IZL2EMmFk80zWCxc3NURPXcuIpS9tj/90+r
        ZojxZ6ESKteWfLaE07T4FFHWDQ2mcTMInctnu80=
X-Google-Smtp-Source: APXvYqwlMutclBn8Bx7dag4sEsJ+9LZQDIcYq2h9CWvDQkadmNsNVk+3MnZWPbRTeTTbIUCFdY3hLNsYS82IN+nZP2o=
X-Received: by 2002:a37:76c3:: with SMTP id r186mr11984957qkc.224.1569702618583;
 Sat, 28 Sep 2019 13:30:18 -0700 (PDT)
MIME-Version: 1.0
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Sat, 28 Sep 2019 16:30:07 -0400
Message-ID: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
Subject: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
To:     peter.chen@nxp.com, Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Good Afternoon,

I've encountered an odd situation where the CI Dual Role driver hard
locks the kernel on the Ouya (Tegra 3).
I was attempting to set up manual mode switching in the kernel, as the
Ouya lacks hardware support for the ID pin and no voltage output on
that port.
I found that the kernel was hard locking whenever I had the dr_mode =
"otg" set in the devicetree.
No further output was seen on the console, and sysreq does not respond.
It occurs both in module and builtin mode.

I have however found a workaround.
By setting the dual role usb device to:
compatible = "nvidia,tegra30-ehci", "nvidia,tegra30-udc";
and setting the assigned phy to:
dr_mode = "peripheral";
I can achieve rudimentary live switching of roles.
The device defaults to host mode, as the ehci driver enumerates first.
By unbinding the tegra-ehci driver and binding the tegra-udc driver, I
can switch to gadget mode.
The reverse also works.
The PHY driver does not appear to care if it is always in peripheral mode.

Thank you for your time,
Peter Geis
