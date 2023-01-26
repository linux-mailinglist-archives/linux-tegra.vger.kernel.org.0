Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B57DF67D618
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Jan 2023 21:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjAZUTd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 26 Jan 2023 15:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbjAZUTb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 Jan 2023 15:19:31 -0500
X-Greylist: delayed 1395 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 26 Jan 2023 12:19:26 PST
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C56E460B1
        for <linux-tegra@vger.kernel.org>; Thu, 26 Jan 2023 12:19:26 -0800 (PST)
Received: from [167.98.27.226] (helo=[10.35.5.149])
        by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
        id 1pL8Lx-000eC0-7l
        for <linux-tegra@vger.kernel.org> ; Thu, 26 Jan 2023 19:56:09 +0000
Message-ID: <c1c0932e-c3cc-6bbc-a196-fc170b0d215a@codethink.co.uk>
Date:   Thu, 26 Jan 2023 19:56:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To:     linux-tegra <linux-tegra@vger.kernel.org>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Subject: jetson tx2 module, no wifi with upstream kernel
Organization: Codethink Limited.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

I've not yet found a kernel version from the current release tree
that brings WiFi up on the Jetson TX2. There doesn't even seem to
be any sort of card detetion with 6.2-rc5

The only sign is the bus gets initialised as mmc2, but then no
card detect:

[    3.177416] mmc2: SDHCI controller on 3440000.mmc [3440000.mmc] using 
ADMA 64-bit

Has anyone seen this or know how to fix it? I know it works under
the L4T which this board has on flash.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
